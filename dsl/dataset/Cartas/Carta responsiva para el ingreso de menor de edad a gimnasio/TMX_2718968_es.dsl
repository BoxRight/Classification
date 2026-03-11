law CartaResponsivaPara
authority private
enacted 2024-08-15

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    LegalGuardian: LegalGuardian Person, natural person
    Minor: Minor Person, natural person
    Gym: Gym Corp, legal person

objects
    GymAccess: service
    PhysicalActivities: service
    FirstAid: service
    MedicalCosts: money

article 1 Generated
    fact certification GuardianshipRelation is present
    fact certification HealthCertification is present
    privilege Minor may provide GymAccess to Gym.
    obligation LegalGuardian must pay MedicalCosts to Gym.
    obligation Minor must perform GymRulesCompliance to Gym.
    rule GymAccessAuthorization
        If certification GuardianshipRelation is present
        then Minor may provide GymAccess to Gym.
    rule LiabilityExemption
        If Gym fails to perform Negligence to Minor
        then Gym may demand LiabilityExemption from LegalGuardian.
    procedure EmergencyResponseProcedure:
        Gym provides FirstAid to Minor.
        Gym performs GuardianNotification to LegalGuardian.
        Gym performs MedicalTransport to Minor.