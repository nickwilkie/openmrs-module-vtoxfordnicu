/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.rest.resource;

import org.openmrs.module.vtoxfordnicu.api.NicuEncounter;
import org.openmrs.module.webservices.rest.web.RequestContext;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.annotation.Resource;
import org.openmrs.module.webservices.rest.web.representation.FullRepresentation;
import org.openmrs.module.webservices.rest.web.representation.Representation;
import org.openmrs.module.webservices.rest.web.resource.impl.BaseDelegatingResource;
import org.openmrs.module.webservices.rest.web.resource.impl.DelegatingCrudResource;
import org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceDescription;
import org.openmrs.module.webservices.rest.web.response.GenericRestException;
import org.openmrs.module.webservices.rest.web.response.ResponseException;

/**
 * @author Nicholas Wilkie
 *
 */
@Resource(name=RestConstants.VERSION_1 + "/vtoxfordnicu/nicuencounter", supportedClass = NicuEncounter.class, supportedOpenmrsVersions = { "1.9.*" })
public class NicuEncounterResource extends DelegatingCrudResource<NicuEncounter>{

	@Override
	public DelegatingResourceDescription getRepresentationDescription(Representation rep) {
		DelegatingResourceDescription description = new DelegatingResourceDescription();
		description.addProperty("givenName");
		description.addProperty("familyName");
		description.addProperty("medicalRecordNumber");
		description.addProperty("encounterDate");
		description.addProperty("completed");
		description.addProperty("encounterId");
		
		if (rep instanceof FullRepresentation) {
			description.addProperty("patient", Representation.DEFAULT);
			description.addProperty("encounter", Representation.DEFAULT);
			return description;
		}
		return description;
	}
	
	public DelegatingResourceDescription getRepresentationDescription() {
		DelegatingResourceDescription description = new DelegatingResourceDescription();
		description.addProperty("patient", Representation.DEFAULT);
		description.addProperty("encounter", Representation.DEFAULT);
		return description;
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.api.Resource#getUri(java.lang.Object)
	 */
	@Override
	public String getUri(Object instance) {
		return "./vtoxfordnicu/";
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceHandler#newDelegate()
	 */
	@Override
	public NicuEncounter newDelegate() {
		return new NicuEncounter();
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceHandler#save(java.lang.Object)
	 */
	@Override
	public NicuEncounter save(NicuEncounter delegate) {
		throw new GenericRestException("Save not supported", new UnsupportedOperationException());
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.impl.BaseDelegatingResource#getByUniqueId(java.lang.String)
	 */
	@Override
	public NicuEncounter getByUniqueId(String uniqueId) {
		return null;
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.impl.BaseDelegatingResource#delete(java.lang.Object, java.lang.String, org.openmrs.module.webservices.rest.web.RequestContext)
	 */
	@Override
	protected void delete(NicuEncounter delegate, String reason,
			RequestContext context) throws ResponseException {
		throw new GenericRestException("Delete not supported", new UnsupportedOperationException());
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.webservices.rest.web.resource.impl.BaseDelegatingResource#purge(java.lang.Object, org.openmrs.module.webservices.rest.web.RequestContext)
	 */
	@Override
	public void purge(NicuEncounter delegate, RequestContext context)
			throws ResponseException {
		throw new GenericRestException("Purge not supported", new UnsupportedOperationException());
	}
}
