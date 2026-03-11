law ConvenioSobreFormación,
authority judicial
enacted 2019-04-01

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Deceased: Deceased Person, natural person
    SurvivingSpouse: SurvivingSpouse Person, natural person
    Heir1: Heir1 Person, natural person
    Heir2: Heir2 Person, natural person
    Heir3: Heir3 Person, natural person
    Notary: Notary Person, natural person

objects
    HereditaryEstate: nonmovable
    ImmovableProperty: nonmovable
    MovableProperty: movable
    InheritanceShare: money
    SuccessionExpenses: money

article 1 Generated
    fact asset IntestateSuccession is present
    fact Deceased owns HereditaryEstate
    fact certification HeirRecognition is present
    obligation Heir must pay SuccessionExpenses to ProportionalShare.
    privilege SurvivingSpouse may perform EstateAdministration to HereditaryEstate.
    obligation Depositary must transfer MovableProperty to NewOwner.
    rule InventoryApprovalRule
        If asset IntestateSuccession is present
        then Parties must perform Inventory to Court.
    rule PartitionRule
        If certification HeirRecognition is present
        then Heir may demand InheritanceShare from HereditaryEstate.
    rule ExpenseSharingRule
        If asset IntestateSuccession is present
        then Heir must pay SuccessionExpenses to ProportionalPayment.
    rule SupplementaryDivisionRule
        If asset NewPropertyDiscovered is present
        then Parties must perform SupplementaryDivision to EqualShares.
    procedure SuccessionAgreement:
        SurvivingSpouse performs SuccessionDenouncement to Court.
        Heirs performs ExecutorDesignation to SurvivingSpouse.
        Parties performs InventoryApproval to Court.
        Parties performs PartitionProject to Court.
        Notary performs DeedExecution to Parties.
    procedure PropertyDelivery:
        Depositary transfers MovableProperty to NewOwner.