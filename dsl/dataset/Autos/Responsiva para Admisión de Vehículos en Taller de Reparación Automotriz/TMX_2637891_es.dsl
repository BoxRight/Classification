law ResponsivaParaAdmisión
authority private
enacted 2023-12-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Person, natural person
    Workshop: Workshop Corp, legal person

objects
    Vehicle: movable
    RepairServices: service
    Payment: money
    PersonalObjects: movable

article 1 Generated
    fact asset RepairContract is present
    fact asset VehicleInWorkshop is present
    fact liability PaymentDue is present
    obligation Workshop must provide RepairServices to Client.
    obligation Client must pay Payment to Workshop.
    obligation Client must transfer PersonalObjects to Client.
    obligation Client must transfer Vehicle to Client.
    obligation Workshop must transfer Vehicle to Client.
    rule RepairApprovalRule
        If asset VehicleInWorkshop is present
        then Client must provide RepairServices to Workshop.
    rule VehicleRetentionRule
        If liability PaymentDue is present
        then Workshop may demand Vehicle from Client.
    procedure VehicleAdmission:
        Client transfers Vehicle to Client.
        Client transfers PersonalObjects to Client.
        Client transfers Vehicle to Workshop.
    procedure RepairProcess:
        Client provides RepairServices to Workshop.
        Workshop provides RepairServices to Client.
    procedure VehicleDelivery:
        Client pays Payment to Workshop.
        Workshop transfers Vehicle to Client.
        Client transfers Vehicle to Client.