/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.extension.html;

import org.openmrs.module.web.extension.LinkExt;

/**
 * @author Nicholas Wilkie
 *
 */
public class GutterLink extends LinkExt {

	/* (non-Javadoc)
	 * @see org.openmrs.module.web.extension.LinkExt#getLabel()
	 */
	@Override
	public String getLabel() {
		return "vtoxfordnicu.gutterlinklabel";
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.web.extension.LinkExt#getRequiredPrivilege()
	 */
	@Override
	public String getRequiredPrivilege() {
		return "";
	}

	/* (non-Javadoc)
	 * @see org.openmrs.module.web.extension.LinkExt#getUrl()
	 */
	@Override
	public String getUrl() {
		return "vtoxfordnicu/main.page";
	}

}
