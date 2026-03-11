law DemandaEnriquecimientoIlegítimo
authority judicial
enacted 2023-11-17

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    DefendantRealEstate: DefendantRealEstate Corp, legal person
    OriginalCompany: OriginalCompany Corp, legal person

objects
    LandProperty: nonmovable
    PurchasePayments: money
    LegalInterests: money
    Damages: money
    CourtCosts: money

article 1 Generated
    fact DefendantRealEstate owns LandProperty
    fact asset PaymentsMade is present
    fact liability UnlawfulEnrichment is present
    obligation DefendantRealEstate must pay PurchasePayments to Plaintiff.
    obligation DefendantRealEstate must pay LegalInterests to Plaintiff.
    obligation DefendantRealEstate must pay Damages to Plaintiff.
    obligation DefendantRealEstate must pay CourtCosts to Plaintiff.
    rule DamagesRule
        If liability UnlawfulEnrichment is present
        then DefendantRealEstate must pay Damages to Plaintiff.

scenario unlawful_enrichment_case:
    at Original purchase contract executed
    at Rights assignment communicated
    at Payments made by plaintiff
    at Deed execution refused
    at Lawsuit filed for unlawful enrichment