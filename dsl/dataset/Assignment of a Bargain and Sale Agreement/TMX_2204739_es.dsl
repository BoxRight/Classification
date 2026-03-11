law AssignmentBargainAnd
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person
    OriginalVendor: OriginalVendor Person, natural person

objects
    AssignmentPrice: money
    PropertyTitle: nonmovable
    BargainSaleAgreement: service

article 1 Generated
    fact asset AssignmentRelation is present
    fact Assignee owns PropertyTitle
    obligation Assignee must pay AssignmentPrice to Assignor.
    obligation OriginalVendor must transfer PropertyTitle to Assignee.
    claim Assignor may demand BargainSaleAgreement from Assignee.
    rule VendorConsentRule
        If asset AssignmentRelation is present
        then OriginalVendor must transfer PropertyTitle to Assignee.
    procedure AssignmentProcess:
        Assignee pays AssignmentPrice to Assignor.
        Assignor provides BargainSaleAgreement to Assignee.
        OriginalVendor transfers PropertyTitle to Assignee.