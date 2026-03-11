law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Petitioner: Petitioner Person, natural person
    Defendant: Defendant Person, natural person
    CourtClerk: CourtClerk Person, natural person
    Judge: Judge Person, natural person

objects
    Notification: service
    EmbargoedVehicle: movable
    NullificationIncident: service

article 1 Generated
    fact certification DefectiveNotification is present
    fact certification ViolationOfDueProcess is present
    fact asset JudicialProceedingInProgress is present
    obligation CourtClerk must provide Notification to Petitioner.
    obligation Petitioner must transfer EmbargoedVehicle to CourtClerk.
    rule ProperNotificationRule
        If certification RequiresPersonalDelivery is present
        then CourtClerk must provide Notification to Petitioner.
    procedure NullificationIncidentProcedure:
        Petitioner provides NullificationIncident to Judge.