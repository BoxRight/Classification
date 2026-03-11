law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Judge: Judge Corp, legal person
    Executor: Executor Person, natural person
    Heirs: Heirs Person, natural person

objects
    InventoryAppraisal: service
    EstateAssets: nonmovable

article 1 Generated
    fact certification SuccessionProceeding is present
    fact asset EstateInventory is present
    obligation Judge must provide InventoryAppraisal to Executor.
    obligation Judge must provide InventoryAppraisal to Heirs.
    rule InventoryApprovalRule
        If certification SuccessionProceeding is present and asset EstateInventory is present
        then Judge must provide InventoryAppraisal to Executor.
    rule NotificationRule
        If certification InventoryApproved is present
        then Judge must provide InventoryAppraisal to Heirs.
    procedure InventoryApprovalProcess:
        Judge provides InventoryAppraisal to Executor.
        Judge provides InventoryAppraisal to Heirs.