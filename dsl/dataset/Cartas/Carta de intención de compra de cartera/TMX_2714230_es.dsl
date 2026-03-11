law CartaIntenciónCompra
authority private
enacted 2024-07-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Buyer: Buyer Corp, legal person
    Seller: Seller Corp, legal person
    Negotiator: Negotiator Person, natural person

objects
    FinancialPortfolio: movable
    PurchasePrice: money
    Documentation: movable

article 1 Generated
    fact asset FinancialPortfolio is present
    obligation Seller must transfer Documentation to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    rule DueDiligenceRule
        If asset FinancialPortfolio is present
        then Buyer may transfer FinancialPortfolio to Seller.
    rule ApprovalConditionRule
        If certification InternalApproval is present
        then Buyer must pay PurchasePrice to Seller.