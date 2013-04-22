/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.fragment.controller;

import java.lang.reflect.Constructor;
import java.util.List;

import org.openmrs.api.EncounterService;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.util.OpenmrsClassLoader;

/**
 * @author Nicholas Wilkie
 *
 */
public class NicuEncountersFragmentController {
    public void controller(FragmentModel model,
    		@SpringBean("encounterService") EncounterService service) {
    	try {
    		Class<?> clazz = OpenmrsClassLoader.getInstance().loadClass("groovy.json.JsonOutput");
    		Constructor<?> constructor = clazz.getConstructor(new Class[] {});
			Object jsonOutput = constructor.newInstance();
			model.addAttribute("jsonOutput", jsonOutput);
		} catch (Exception e) {
			throw new RuntimeException("Could not load groovy JsonOutput!", e);
		}
    }
    
    public List<SimpleObject> searchEncounters() {
    	return null;
    }
}
