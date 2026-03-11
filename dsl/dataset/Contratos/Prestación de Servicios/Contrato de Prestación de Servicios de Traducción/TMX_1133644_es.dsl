law ServiceContract
authority private
enacted 2024-02-13

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    Translator: Translator Person, natural person

objects
    TranslationWork: service
    PaymentAmount: money
    OriginalWork: service
    TranslatedWork: service
    BookCopies: movable

article 1 Generated
    fact asset TranslationContract is present
    fact certification TranslatorQualification is present
    obligation Translator must provide TranslationWork to Client.
    obligation Client must pay PaymentAmount to Translator.
    obligation Client must transfer BookCopies to Translator.
    obligation Client must provide TranslatedWork to Client.
    prohibition Translator must not provide TranslatedWork.
    prohibition Client must not provide TranslationWork.
    prohibition Translator must not provide TranslationWork.
    rule TranslationObligationRule
        If asset TranslationContract is present
        then Translator must provide TranslationWork to Client.
    rule PaymentObligationRule
        If asset TranslationContract is present
        then Client must pay PaymentAmount to Translator.
    procedure ContractExecution:
        Translator provides TranslationWork to Client.
        Client pays PaymentAmount to Translator.
        Client provides TranslatedWork to Client.
        Client transfers BookCopies to Translator.