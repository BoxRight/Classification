law ConstitutiveDeed
authority private
enacted 2024-09-07

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Association: Association Corp, legal person
    Associates: Associates Person, natural person
    GeneralAssembly: GeneralAssembly Corp, legal person
    BoardOfDirectors: BoardOfDirectors Corp, legal person
    Director: Director Person, natural person
    Liquidators: Liquidators Person, natural person

objects
    WellnessPrograms: service
    SportsActivities: service
    NutritionServices: service
    TrainingPrograms: service
    EnvironmentalCare: service
    RealEstateAssets: nonmovable
    MovableAssets: movable
    Contributions: money
    Donations: money
    Fees: money

article 1 Generated
    fact certification AssociationStatus is present
    fact Association owns RealEstateAssets
    obligation Association must provide WellnessPrograms to Associates.
    obligation Associates must pay Fees to Association.
    obligation Associates must perform Attendance to GeneralAssembly.
    prohibition Associates must not perform PatrimonyDistribution.
    prohibition Associates must not perform ContributionRecovery.
    rule LiquidationProcess
        If asset AssociationDissolution is present
        then Liquidators must perform LiquidationProcess to Association.
    procedure AssemblyConvocation:
        Director performs ConvocationNotice to Associates.
        Associates performs Attendance to GeneralAssembly.
    procedure LiquidationProcedure:
        GeneralAssembly performs LiquidatorAppointment to Liquidators.
        Liquidators performs DebtPayment to Creditors.
        Liquidators performs AssetDistribution to SimilarOrganizations.
        Liquidators performs FinalReport to GeneralAssembly.