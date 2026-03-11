law ConvenioReparaciónDel
authority private
enacted 2024-02-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    CentroMedico: CentroMedico Corp, legal person
    Paciente: Paciente Person, natural person

objects
    MedicalTreatment: service
    CompensationPayment: money
    LegalActionWaiver: service

article 1 Generated
    fact liability MedicalMalpracticeLiability is present
    fact certification DamageRecognition is present
    obligation CentroMedico must provide MedicalTreatment to Paciente.
    obligation CentroMedico must pay CompensationPayment to Paciente.
    obligation Paciente must provide LegalActionWaiver to CentroMedico.
    rule MedicalTreatmentObligation
        If liability MedicalMalpracticeLiability is present
        then CentroMedico must provide MedicalTreatment to Paciente.
    rule CompensationObligation
        If certification DamageRecognition is present
        then CentroMedico must pay CompensationPayment to Paciente.