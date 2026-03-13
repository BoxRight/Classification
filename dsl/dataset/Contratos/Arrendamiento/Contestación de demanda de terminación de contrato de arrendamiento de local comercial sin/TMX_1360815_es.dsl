law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide
    verb terminate: terminate
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Corp, legal person
    Defendant: Defendant Corp, legal person

objects
    CommercialLeaseContract: service
    RentalPayment: money
    PropertyAttachment: movable

article 1 Generated
    fact asset LeaseRelation is present
    fact certification RentPaymentsCurrent is present
    fact liability PropertyAttachment is present
    obligation Defendant must pay RentalPayment to Plaintiff.
    rule PaymentDefenseRule
        If certification RentPaymentsCurrent is present
        then Plaintiff may terminate CommercialLeaseContract.
    rule AttachmentOppositionRule
        If certification RentPaymentsCurrent is present
        then CourtOfficer may demand CommercialLeaseContract from Defendant.