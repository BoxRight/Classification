law DemandaTestamentoInoficioso
authority judicial
enacted 2023-02-21

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    SurvivingSpouse: SurvivingSpouse Person, natural person
    DeceasedSpouse: DeceasedSpouse Person, natural person
    Child1: Child1 Person, natural person
    Child2: Child2 Person, natural person
    UniversalHeir: UniversalHeir Person, natural person
    Executor: Executor Person, natural person
    Succession: Succession Corp, legal person

objects
    InheritanceAssets: movable
    MonthlyAlimony: money
    Testament: movable
    MonthlyIncome: money

article 1 Generated
    fact certification MarriageRelation is present
    fact certification FilialRelation is present
    fact certification FilialRelation is present
    fact certification DeathCertification is present
    fact certification TestamentaryDesignation is present
    fact asset InheritanceEstate is present
    fact liability AlimonyObligation is present
    obligation DeceasedSpouse must pay MonthlyAlimony to SurvivingSpouse.
    obligation DeceasedSpouse must pay MonthlyAlimony to Child1.
    obligation DeceasedSpouse must pay MonthlyAlimony to Child2.
    prohibition UniversalHeir must not transfer InheritanceAssets.
    rule AlimonyEntitlementRule
        If certification MarriageRelation is present
        then SurvivingSpouse may demand MonthlyAlimony from Succession.
    rule ChildAlimonyEntitlementRule
        If certification FilialRelation is present
        then Child1 may demand MonthlyAlimony from Succession.
    rule ProvisionalMeasureRule
        If certification TestamentaryInofficiousness is present
        then UniversalHeir must not transfer InheritanceAssets.