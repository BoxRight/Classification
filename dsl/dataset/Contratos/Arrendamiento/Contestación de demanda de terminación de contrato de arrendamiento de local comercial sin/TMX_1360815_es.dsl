law LeaseContract
authority judicial
enacted 2024-01-23

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Corp, legal person
    Defendant: Defendant Corp, legal person
    Court: Court Corp, legal person

objects
    CommercialLease: service
    RentPayments: money
    CommercialProperty: nonmovable

article 1 Generated
    fact asset LeaseRelation is present
    fact asset CurrentRentPayments is present
    claim Defendant may demand CommercialLease from Plaintiff.
    rule PaymentCurrentDefense
        If asset CurrentRentPayments is present
        then Defendant may fail CommercialLease to Plaintiff.
    rule EmbargoOpposition
        If asset CurrentRentPayments is present
        then Defendant may demand CommercialProperty from Court.