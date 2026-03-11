law LeyAmparo,Reglamentaria
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Appellant: Appellant Person, natural person
    CollegiateCircuitCourt: CollegiateCircuitCourt Corp, legal person
    SuperiorCourtChamber: SuperiorCourtChamber Corp, legal person
    HarmedThirdParty: HarmedThirdParty Person, natural person

objects
    DirectAmparoDemand: service
    JustifiedReport: service
    Bond: money
    MonthlyRent: money
    AnnualRent: money
    CourtCosts: money

article 1 Generated
    fact certification AmparoDemandAdmitted is present
    fact asset SuspensionGranted is present
    fact liability BondRequirement is present
    obligation SuperiorCourtChamber must provide JustifiedReport to CollegiateCircuitCourt.
    obligation Appellant must pay Bond to SuperiorCourtChamber.
    rule BondPostingRule
        If asset SuspensionGranted is present
        then Appellant must pay Bond to SuperiorCourtChamber.
    procedure AmparoAdmissionProcedure:
        Appellant provides DirectAmparoDemand to CollegiateCircuitCourt.
        SuperiorCourtChamber provides JustifiedReport to CollegiateCircuitCourt.
        Appellant pays Bond to SuperiorCourtChamber.