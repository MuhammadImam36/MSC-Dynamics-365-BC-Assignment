table 50300 Equipment
{
    Caption = 'Equipment';
    DataClassification = CustomerContent;
    LookupPageId = "Equipment List";
    // DrillDownPageId = "Equipment List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Category; Code[20])
        {
            Caption = 'Category';
        }
        field(4; Status; Enum "Equipment Status")
        {
            Caption = 'Status';
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        EquipmentSetup: Record "Equipment Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Code = '' then begin
            EquipmentSetup.GetSetup();
            EquipmentSetup.TestField("Equipment Nos.");
            "No. Series" := EquipmentSetup."Equipment Nos.";
            Code := NoSeries.GetNextNo("No. Series");
        end;
    end;
}