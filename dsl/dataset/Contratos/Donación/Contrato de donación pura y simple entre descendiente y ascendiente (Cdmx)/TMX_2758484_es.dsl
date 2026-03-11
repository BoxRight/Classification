law ContratoDonaciónPura
authority private
enacted 2024-12-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Donante: Donante Person, natural person
    Donatario: Donatario Person, natural person

objects
    DonatedMoney: money

article 1 Generated
    fact certification DescendantRelationship is present
    fact certification AscendantRelationship is present
    fact asset DonationContract is present
    obligation Donante must pay DonatedMoney to Donatario.
    obligation Donatario must pay DonatedMoney to Donante.
    prohibition Donatario must not perform DonationRights.
    rule DonationTransferRule
        If asset DonationContract is present and certification DescendantRelationship is present and certification AscendantRelationship is present
        then Donante must pay DonatedMoney to Donatario.
    rule DonationAcceptanceRule
        If asset DonationContract is present
        then Donatario must pay DonatedMoney to Donante.
    rule NoThirdPartyTransferRule
        If asset DonationContract is present
        then Donatario must not perform DonationRights.
    procedure DonationExecution:
        Donante pays DonatedMoney to Donatario.
        Donatario pays DonatedMoney to Donante.
        Donatario pays DonatedMoney to Donante.