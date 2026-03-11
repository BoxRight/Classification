law ContratoPermutaBienes
authority private
enacted 2024-02-05

vocabulary
    verb transfer: transfer

parties
    Fiduciary: Fiduciary Corp, legal person
    FiduciaryDelegate: FiduciaryDelegate Person, natural person
    IndividualParty: IndividualParty Person, natural person
    IndividualSpouse: IndividualSpouse Person, natural person
    Trustor1: Trustor1 Corp, legal person
    Trustor2: Trustor2 Person, natural person

objects
    LandFractionsIndividual: nonmovable
    LandLotsTrust: nonmovable
    TrustPatrimony: nonmovable

article 1 Generated
    fact IndividualParty owns LandFractionsIndividual
    fact Fiduciary owns LandFractionsIndividual
    fact certification PropertyFreeOfLiens is present
    fact asset TrustRelationship is present
    obligation IndividualParty must transfer LandFractionsIndividual to Fiduciary.
    obligation Fiduciary must transfer LandLotsTrust to IndividualParty.
    obligation IndividualParty must perform WarrantyAgainstEviction to Fiduciary.
    obligation Fiduciary must perform WarrantyAgainstEviction to IndividualParty.
    procedure PropertyExchangeProcedure:
        IndividualParty transfers LandFractionsIndividual to Fiduciary.
        Fiduciary transfers LandLotsTrust to IndividualParty.
        Fiduciary transfers LandFractionsIndividual to TrustPatrimony.