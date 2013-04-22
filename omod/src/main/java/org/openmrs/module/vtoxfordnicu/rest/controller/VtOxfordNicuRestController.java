/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.rest.controller;

import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.v1_0.controller.MainResourceController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Nicholas Wilkie
 *
 */
@Controller
@RequestMapping(value = "/rest/" + RestConstants.VERSION_1 + "/vtoxfordnicu")
public class VtOxfordNicuRestController extends MainResourceController {
    /**
     * @see org.openmrs.module.webservices.rest.web.v1_0.controller.BaseRestController#getNamespace()
     */
    @Override
    public String getNamespace() {
        return RestConstants.VERSION_1 + "/vtoxfordnicu";
    }
}
