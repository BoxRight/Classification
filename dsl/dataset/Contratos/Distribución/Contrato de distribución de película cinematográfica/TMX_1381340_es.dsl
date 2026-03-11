law ContratoDistribuciónPelícula
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Producer: Producer Corp, legal person
    Distributor: Distributor Corp, legal person

objects
    Film: service
    MinimumGuaranteed: money
    DistributionCommission: money
    NetIncome: money
    FilmMaterials: movable

article 1 Generated
    fact asset DistributionContract is present
    obligation Producer must transfer FilmMaterials to Distributor.
    obligation Distributor must pay MinimumGuaranteed to Producer.
    obligation Producer must pay NetIncome to Distributor.
    rule CinemaCommissionRule
        If asset DistributionContract is present
        then Distributor may demand DistributionCommission from Producer.
    procedure MaterialDelivery:
        Producer transfers FilmMaterials to Distributor.
    procedure PaymentProcess:
        Distributor pays MinimumGuaranteed to Producer.