/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.rest.search;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Form;
import org.openmrs.Obs;
import org.openmrs.api.ConceptService;
import org.openmrs.api.EncounterService;
import org.openmrs.api.FormService;
import org.openmrs.api.ObsService;
import org.openmrs.api.PatientService;
import org.openmrs.api.PersonService;
import org.openmrs.module.vtoxfordnicu.api.NicuEncounter;
import org.openmrs.module.webservices.rest.web.RequestContext;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.resource.api.PageableResult;
import org.openmrs.module.webservices.rest.web.resource.api.SearchConfig;
import org.openmrs.module.webservices.rest.web.resource.api.SearchHandler;
import org.openmrs.module.webservices.rest.web.resource.api.SearchQuery;
import org.openmrs.module.webservices.rest.web.resource.impl.NeedsPaging;
import org.openmrs.module.webservices.rest.web.response.ResponseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * @author Nicholas Wilkie
 *
 */
@Component
public class NicuEncounterSearchHandler implements SearchHandler{
	@Autowired
	@Qualifier("encounterService")
	EncounterService encounterService;

	@Autowired
	@Qualifier("obsService")
	ObsService obsService;

	@Autowired
	@Qualifier("patientService")
	PatientService patientService;

	@Autowired
	@Qualifier("personService")
	PersonService personService;

	@Autowired
	@Qualifier("formService")
	FormService formService;

	@Autowired
	@Qualifier("conceptService")
	ConceptService conceptService;

	private final SearchConfig searchConfig = new SearchConfig("default", RestConstants.VERSION_1 + "/vtoxfordnicu/nicuencounter", Arrays.asList("1.8.*", "1.9.*"),
	        new SearchQuery.Builder("Allows you to find encounter/patient pairs").withRequiredParameters("completedOnly", "formId")
	                .withOptionalParameters("encounterDateStart").build());

	/**
	 * @see org.openmrs.module.webservices.rest.web.resource.api.SearchHandler#getSearchConfig()
	 */
	@Override
	public SearchConfig getSearchConfig() {
		return searchConfig;
	}

	enum CompletedFilter {COMPLETED_ONLY, INCOMPLETE_ONLY, ALL};
	
	/**
	 * @see org.openmrs.module.webservices.rest.web.resource.api.SearchHandler#search(org.openmrs.module.webservices.rest.web.RequestContext)
	 */
	@Override
	public PageableResult search(RequestContext context) throws ResponseException {
		String completed = context.getParameter("completedOnly");
		String form = context.getParameter("formId");
		String encounterDateStart = context.getParameter("encounterDateStart");
		
		CompletedFilter completedFilter;
		if (completed != null && completed.equalsIgnoreCase("true")) {
			completedFilter = CompletedFilter.COMPLETED_ONLY;
		} else if(completed != null && completed.equalsIgnoreCase("false")) {
			completedFilter = CompletedFilter.INCOMPLETE_ONLY;
		} else {
			completedFilter = CompletedFilter.ALL;
		}
		
		Form nicuForm = formService.getForm(Integer.parseInt(form));
		List<Form> formlist = new ArrayList<Form>();
		formlist.add(nicuForm);

		Concept formStatus = conceptService.getConcept("NICU Form Status");
		List<Concept> formQuestions = new ArrayList<Concept>();
		formQuestions.add(formStatus);

		Concept formCompleted = conceptService.getConcept("Form Complete");
		List<Concept> formCompletedAnswers = new ArrayList<Concept>();
		formCompletedAnswers.add(formStatus);

		//Context.getEncounterService().getEncounters(who, loc, fromDate, toDate, enteredViaForms, encounterTypes, providers, includeVoided)
		List<Encounter> allEncounters = encounterService.getEncounters(null, null, null, null, formlist, null, null, null, null, false);
		List<NicuEncounter> nicuEncounters = new ArrayList<NicuEncounter>();
		for (Encounter encounter : allEncounters) {
		    Set<Obs> allObs = encounter.getObs();
		    boolean encounterComplete = false;
		    for (Obs obs : allObs) {
		        if (obs.getConcept().getName().getName().equals("NICU Form Status") && 
		        		obs.getValueCoded().getName().getName().equals("Form Completed")) {
		        	encounterComplete = true;
		            break;
		        }
		    }
		    if (completedFilter == CompletedFilter.ALL || 
		    		(completedFilter == CompletedFilter.COMPLETED_ONLY && encounterComplete) ||
		    		(completedFilter == CompletedFilter.INCOMPLETE_ONLY && !encounterComplete)) {
		    	NicuEncounter nicuEncounter = new NicuEncounter();
				nicuEncounter.fillVariablesFromEncounter(encounter);
				nicuEncounter.setCompleted(encounterComplete);
				
				nicuEncounters.add(nicuEncounter);
		    }
		}
		
		Collections.sort(nicuEncounters, new Comparator<NicuEncounter>() {

			@Override
			public int compare(NicuEncounter arg0, NicuEncounter arg1) {
				if((arg0 == null || arg0.getEncounterDate() == null) &&
						(arg1 == null || arg1.getEncounterDate() == null)) {
					return 0;
				} else if (arg0 == null || arg0.getEncounterDate() == null) {
					return 1;
				} else if (arg1 == null || arg1.getEncounterDate() == null) {
					return -1;
				}
				
				return arg1.getEncounterDate().compareTo(arg0.getEncounterDate());
			}
			
		});

		return new NeedsPaging<NicuEncounter>(nicuEncounters, context);
	}

//		ConceptSource conceptSource = conceptService.getConceptSourceByUuid(source);
//		if (conceptSource == null) {
//			conceptSource = conceptService.getConceptSourceByName(source);
//		}
//		if (conceptSource == null) {
//			return new EmptySearchResult();
//		}
//
//		if (code == null) {
//			List<ConceptMap> conceptMaps = conceptService.getConceptsByConceptSource(conceptSource);
//			List<Concept> concepts = new ArrayList<Concept>();
//			for (ConceptMap conceptMap : conceptMaps) {
//				if (!conceptMap.getConcept().isRetired() || context.getIncludeAll()) {
//					concepts.add(conceptMap.getConcept());
//				}
//			}
//			return new NeedsPaging<Concept>(concepts, context);
//		} else {
//			List<Concept> conceptsByMapping = conceptService.getConceptsByMapping(code, source, false);
//
//			return new NeedsPaging<Concept>(conceptsByMapping, context);
//		}

}
