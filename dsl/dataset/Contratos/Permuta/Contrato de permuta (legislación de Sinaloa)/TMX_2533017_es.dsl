law ContratoPermuta(legislación
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    PartyA: PartyA Person, natural person
    PartyB: PartyB Person, natural person

objects
    PropertyA: nonmovable
    PropertyB: nonmovable
    PenaltyPayment: money

article 1 Generated
    fact PartyA owns PropertyA
    fact PartyB owns PropertyA
    obligation PartyA must transfer PropertyA to PartyB.
    obligation PartyB must transfer PropertyB to PartyA.
    rule BreachPenaltyRule
        If PartyA fails to transfer PropertyA to PartyB
        then PartyA must pay PenaltyPayment to PartyB.
    rule BreachPenaltyRuleB
        If PartyB fails to transfer PropertyB to PartyA
        then PartyB must pay PenaltyPayment to PartyA.