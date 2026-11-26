table 50302 "Loan Header"
{
    Caption = 'Loan Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Employee; Text[100])
        {
            Caption = 'Employee';

            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        field(3; "Loan Date"; Date)
        {
            Caption = 'Loan Date';
            trigger OnValidate()
            begin
                TestStatusOpen();
                CheckDates();
            end;
        }
        field(4; "Expected Return Date"; Date)
        {
            Caption = 'Expected Return Date';

            trigger OnValidate()
            begin
                TestStatusOpen();
                CheckDates();
            end;
        }
        field(5; "Status"; Enum "Loan Status")
        {
            Caption = 'Status';
            Editable = false;
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
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        ReturnDateBeforeLoanDateErr: Label 'Expected Return Date cannot be earlier than Loan Date.';
        OnlyOpenCanBeReleasedErr: Label 'Only an Open loan can be released. Current status: %1.';
        NoLinesErr: Label 'Loan %1 must have at least one line before it can be released.';
        UnderMaintenanceErr: Label 'Equipment %1 is under maintenance and cannot be loaned.';

    local procedure CheckDates()
    begin
        if ("Loan Date" <> 0D) and ("Expected Return Date" <> 0D) then
            if "Expected Return Date" < "Loan Date" then
                Error(ReturnDateBeforeLoanDateErr);
    end;

    local procedure TestStatusOpen()
    begin
        TestField(Status, Status::Open)
    end;

    procedure Release()
    var
        LoanLine: Record "Loan Line";
        Equipment: Record Equipment;
    begin
        if Status <> Status::Open then
            Error(OnlyOpenCanBeReleasedErr, Status);

        LoanLine.SetRange("Document No.", "No.");
        if LoanLine.IsEmpty() then
            Error(NoLinesErr, "No.");

        if LoanLine.FindSet() then
            repeat
                Equipment.Get(LoanLine."Equipment Code");
                Equipment.TestField(Blocked, false);
                if Equipment.Status = Equipment.Status::"Under Maintenance" then
                    Error(UnderMaintenanceErr, Equipment.Code);
            until LoanLine.Next() = 0;

        Status := Status::Released;
        Modify(true);
    end;

    procedure ReOpen()
    begin
        if Status <> Status::Released then
            Error(OnlyOpenCanBeReleasedErr, Status);

        Status := Status::Open;
        Modify(true);
    end;

    trigger OnInsert()
    var
        EquipmentSetup: Record "Equipment Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            EquipmentSetup.GetSetup();
            EquipmentSetup.TestField("Loan Nos.");
            "No. Series" := EquipmentSetup."Loan Nos.";
            "No." := NoSeries.GetNextNo("No. Series");
        end;

        if "Loan Date" = 0D then
            "Loan Date" := WorkDate();
    end;

    trigger OnDelete()
    begin
        TestStatusOpen();
    end;
}