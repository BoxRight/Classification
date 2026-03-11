law ContratoServidumbreDesagüe
authority private
enacted 2024-02-14

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    DominantOwnerHusband: DominantOwnerHusband Person, natural person
    DominantOwnerWife: DominantOwnerWife Person, natural person
    ServientOwner: ServientOwner Person, natural person
    Notary: Notary Person, natural person

objects
    DominantProperty: nonmovable
    ServientProperty: nonmovable
    Rainwater: movable
    RoofOverhang: nonmovable
    NotarialCosts: money

article 1 Generated
    fact ServientOwner owns DominantProperty
    fact DominantOwnerHusband owns DominantProperty
    fact DominantOwnerWife owns DominantProperty
    fact asset DrainageEasement is present
    fact asset RoofOverhangExistence is present
    privilege ServientOwner may transfer Rainwater to ServientProperty.
    obligation ServientOwner must pay NotarialCosts to Notary.
    obligation DominantOwnerHusband must pay NotarialCosts to Notary.
    rule DrainageRightRule
        If asset DrainageEasement is present and asset RoofOverhangExistence is present
        then ServientOwner may transfer Rainwater to ServientProperty.
    rule CostSharingRule
        If asset DrainageEasement is present
        then ServientOwner must pay NotarialCosts to Notary.