page 50305 "Loan List"
{
    Caption = 'Loans';
    PageType = List;
    SourceTable = "Loan Header";
    CardPageId = "Loan Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan document number.';
                }
                field(Employee; Rec.Employee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan document number.';
                }
                field("Loan Date"; Rec."Loan Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the equipment is loaned out.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the equipment is expected to be returned.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the loan document: open, released, or returned.';
                }
            }
        }
    }
}