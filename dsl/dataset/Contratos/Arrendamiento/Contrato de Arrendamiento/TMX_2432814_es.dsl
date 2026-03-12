law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb cancel: cancel
    verb damage: damage
    verb notify: notify
    verb pay: pay
    verb sublease: sublease
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    EventVenue: nonmovable
    AdvancePayment: money
    FinalPayment: money
    SecurityDeposit: money
    RepairCost: money
    CancellationNotice: service
    Event: service

article 1 Generated
    fact asset LeaseRelation is present
    fact asset SecurityDepositHeld is present
    fact asset GuaranteeActive is present
    fact asset EventScheduled is present
    obligation Tenant must pay AdvancePayment to Landlord.
    obligation Tenant must pay FinalPayment to Landlord.
    obligation Landlord must transfer EventVenue to Tenant.
    prohibition Tenant must not sublease EventVenue.
    rule AdvancePaymentRule
        If asset LeaseRelation is present
        then Tenant must pay AdvancePayment to Landlord.
    rule FinalPaymentRule
        If asset EventScheduled is present
        then Tenant must pay FinalPayment to Landlord.
    rule DamageLiabilityRule
        If Tenant damages EventVenue
        then Tenant must pay RepairCost to Landlord.
    rule DepositReturnRule
        If asset SecurityDepositHeld is present and Tenant does not damage EventVenue
        then Landlord must pay SecurityDeposit to Tenant.
    rule GuarantorLiabilityRule
        If asset GuaranteeActive is present and Tenant fails to pay AdvancePayment to Landlord
        then Guarantor must pay AdvancePayment to Landlord.
    rule GuarantorLiabilityRule1
        If asset GuaranteeActive is present and Tenant fails to pay FinalPayment to Landlord
        then Guarantor must pay FinalPayment to Landlord.
    procedure CancellationProcedure:
        Tenant notifies CancellationNotice to Landlord.
        Tenant cancels Event.