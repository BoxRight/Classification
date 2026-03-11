law SaleContract
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Goods: movable
    SalePrice: money
    DownPayment: money
    RemainingBalance: money
    MonthlyInstallment: money

article 1 Generated
    fact asset SaleContract is present
    fact collateral PledgeCollateral is present
    fact liability SolidaryGuarantee is present
    obligation Seller must transfer Goods to Buyer.
    obligation Buyer must pay DownPayment to Seller.
    obligation Buyer must pay MonthlyInstallment to Seller.
    prohibition Buyer must not transfer Goods.
    rule DefaultAccelerationRule
        If Buyer fails to pay MonthlyInstallment to Seller
        then Seller may demand RemainingBalance from Buyer.
    rule ExtrajudicialSaleRule
        If Buyer fails to pay MonthlyInstallment to Seller
        then Seller may transfer Goods to ThirdParty.
    rule GuarantorLiabilityRule
        If Buyer fails to pay MonthlyInstallment to Seller
        then Guarantor must pay RemainingBalance to Seller.
    rule AddressChangePenaltyRule
        If Buyer fails to perform AddressNotification to Seller
        then Buyer must perform PenaltyFee to Seller.
    procedure PaymentSchedule:
        Buyer pays DownPayment to Seller.