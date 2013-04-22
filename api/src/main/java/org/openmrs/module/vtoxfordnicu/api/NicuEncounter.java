/**
 * 
 */
package org.openmrs.module.vtoxfordnicu.api;

import java.util.Date;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;


/**
 * @author Nicholas Wilkie
 *
 */
public class NicuEncounter {
	private String givenName;
	private String familyName;
	private String medicalRecordNumber;
	private Date encounterDate;
	private boolean completed;

	private Encounter encounter;
	private Integer encounterId;
	private Patient patient;
	
	//requires Encounter to be filled
	public void fillVariablesFromEncounter(Encounter e) {
		this.encounter = e;
		this.patient = e.getPatient();
		
		this.givenName = e.getPatient().getGivenName(); 
		this.familyName = e.getPatient().getFamilyName(); 
		
		PatientIdentifier patientIdentifier = e.getPatient().getPatientIdentifier();
		if (patientIdentifier != null) {
			this.medicalRecordNumber = patientIdentifier.toString();
		}
		this.encounterDate = e.getEncounterDatetime();
		this.encounterId = e.getId();
	}

	/**
	 * @return the givenName
	 */
	public String getGivenName() {
		return givenName;
	}

	/**
	 * @param givenName the givenName to set
	 */
	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}

	/**
	 * @return the familyName
	 */
	public String getFamilyName() {
		return familyName;
	}

	/**
	 * @param familyName the familyName to set
	 */
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	/**
	 * @return the medicalRecordNumber
	 */
	public String getMedicalRecordNumber() {
		return medicalRecordNumber;
	}

	/**
	 * @param medicalRecordNumber the medicalRecordNumber to set
	 */
	public void setMedicalRecordNumber(String medicalRecordNumber) {
		this.medicalRecordNumber = medicalRecordNumber;
	}

	/**
	 * @return the encounterDate
	 */
	public Date getEncounterDate() {
		return encounterDate;
	}

	/**
	 * @param encounterDate the encounterDate to set
	 */
	public void setEncounterDate(Date encounterDate) {
		this.encounterDate = encounterDate;
	}

	/**
	 * @return the completed
	 */
	public boolean isCompleted() {
		return completed;
	}

	/**
	 * @param completed the completed to set
	 */
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	/**
	 * @return the encounter
	 */
	public Encounter getEncounter() {
		return encounter;
	}

	/**
	 * @param encounter the encounter to set
	 */
	public void setEncounter(Encounter encounter) {
		this.encounter = encounter;
	}

	/**
	 * @return the patient
	 */
	public Patient getPatient() {
		return patient;
	}

	/**
	 * @param patient the patient to set
	 */
	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Integer getEncounterId() {
		return encounterId;
	}

	public void setEncounterId(Integer encounterId) {
		this.encounterId = encounterId;
	}
}
