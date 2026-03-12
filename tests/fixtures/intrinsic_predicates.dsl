law IntrinsicTest
authority private
enacted 2024-01-01

vocabulary
    verb pay: pay
    verb notify: notify

parties
    Tenant: Tenant Person, natural person
    Landlord: Landlord Corp, legal person

objects
    AdvancePayment: money
    EventDate: service
    NotificationDate: service
    Production: money
    DamageAmount: money
    StartDate: service
    EndDate: service
    Deadline: service
    FilingDate: service
    Income: money

article 1 IntrinsicPredicates
    rule DaysBetweenRule
        If daysBetween EventDate NotificationDate 30
        then Tenant must pay AdvancePayment to Landlord.
    rule DaysBetweenThresholdRule
        If daysBetween EventDate NotificationDate < 30
        then Tenant must pay AdvancePayment to Landlord.
    rule PercentageRule
        If percentage AdvancePayment 50
        then Tenant must pay AdvancePayment to Landlord.
    rule AboveThresholdRule
        If aboveThreshold Production 10000
        then Tenant must pay AdvancePayment to Landlord.
    rule BelowThresholdRule
        If belowThreshold DamageAmount 5000
        then Tenant must pay AdvancePayment to Landlord.
    rule BetweenRule
        If between StartDate EndDate Deadline
        then Tenant must pay AdvancePayment to Landlord.
    rule WithinWindowRule
        If withinWindow FilingDate 2025-06-01 2025-08-31
        then Tenant must pay AdvancePayment to Landlord.
    rule TaxAmountRule
        If taxAmount Income 25
        then Tenant must pay AdvancePayment to Landlord.
