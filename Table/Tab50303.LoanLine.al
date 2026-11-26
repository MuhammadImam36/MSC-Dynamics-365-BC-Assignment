table 50303 "Loan Line"
{
    Caption = 'Loan Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Loan Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Equipment Code"; Code[20])
        {
            Caption = 'Equipment Code';
            TableRelation = Equipment;

            trigger OnValidate()
            var
                Equipment: Record Equipment;
                UnderMaintenanceErr: Label 'Equipment %1 is under maintenance and cannot be loaned.';
            begin
                if "Equipment Code" = '' then
                    Description := ''
                else begin
                    Equipment.Get("Equipment Code");
                    Equipment.TestField(Blocked, false);
                    if Equipment.Status = Equipment.Status::"Under Maintenance" then
                        Error(UnderMaintenanceErr, "Equipment Code");
                    Description := Equipment.Description;
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(5; "Condition on Loan"; Text[100])
        {
            Caption = 'Condition on Loan';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        CheckHeaderOpen()
    end;

    trigger OnModify()
    begin
        CheckHeaderOpen()
    end;

    trigger OnDelete()
    begin
        CheckHeaderOpen()
    end;

    local procedure CheckHeaderOpen()
    var
        LoanHeader: Record "Loan Header";
    begin
        LoanHeader.Get("Document No.");
        LoanHeader.TestField(Status, LoanHeader.Status::Open);
    end;
}