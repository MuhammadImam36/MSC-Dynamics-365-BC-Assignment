page 50300 "Equipment Setup"
{
    ApplicationArea = All;
    Caption = 'Equipment Setup';
    PageType = Card;
    SourceTable = "Equipment Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Equipment Nos."; Rec."Equipment Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series used to assign codes to new equipment.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.GetSetup();
    end;
}