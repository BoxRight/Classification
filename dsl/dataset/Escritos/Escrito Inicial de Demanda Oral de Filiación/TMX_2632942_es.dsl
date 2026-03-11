law DemandaOralFiliación
authority judicial
enacted 2023-11-27

vocabulary
    verb pay: pay
    verb provide: provide

parties
    PlaintiffMother: PlaintiffMother Person, natural person
    DefendantFather: DefendantFather Person, natural person
    MinorChild: MinorChild Person, natural person

objects
    PaternityRecognition: service
    CivilRegistryInscription: service
    LegalCosts: money
    PregnancyExpenses: money
    BirthExpenses: money

article 1 Generated
    fact asset RomanticRelationship is present
    fact asset BirthCertificate is present
    fact liability FinancialBurden is present
    obligation DefendantFather must provide PaternityRecognition to MinorChild.
    obligation DefendantFather must provide CivilRegistryInscription to MinorChild.
    obligation DefendantFather must pay LegalCosts to PlaintiffMother.
    rule CivilRegistryRule
        If DefendantFather fails to provide PaternityRecognition to MinorChild
        then Judge must provide CivilRegistryInscription to MinorChild.

scenario paternity_case_timeline:
    at romantic_relationship_start
    at pregnancy_occurs
    at pregnancy_notification_to_father
    at father_refuses_responsibility
    at relationship_ends
    at child_birth
    at civil_registry_inscription_mother_only
    at paternity_lawsuit_filed