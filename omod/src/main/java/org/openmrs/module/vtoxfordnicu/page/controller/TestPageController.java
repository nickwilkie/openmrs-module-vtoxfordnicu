/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.page.controller;

import org.openmrs.Person;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author Nicholas Wilkie
 *
 */
public class TestPageController {
    public void controller (PageModel pageModel,
                            @RequestParam(value = "person", required = false) Person personParam,
                            @RequestParam(value = "personId", required = false) Integer personId,
                            @RequestParam(value = "name", required = false) String name,
                            UiUtils ui) {

        // fetch any person that may have been specified
//        Person person = ProviderManagementWebUtil.getPerson(personParam, personId);
//
//        // if no person has been specified, see if we have received a name that we should populate
//        // the new record with
//        if (person == null && StringUtils.isNotBlank(name)) {
//            person = new Person();
//            person.addName(Context.getPersonService().parsePersonName(name));
//        }
//
//        pageModel.addAttribute("person", person);
    	pageModel.addAttribute("favoriteText", "This is my favorite text!");
    }
}
