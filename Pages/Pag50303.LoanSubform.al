page 50303 "Loan Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Loan Line";
    AutoSplitKey = true;
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                Editable = IsEditable;
                field("Equipment Code";
                Rec."Equipment Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the equipment being loaned.';
                }
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the equipment. Filled in automatically.';
                }
                field("Condition on Loan"; Rec."Condition on Loan")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the condition of the equipment when it is loaned out.';
                }
            }
        }
    }
    var
        IsEditable: Boolean;

    procedure SetEditableState(NewEditable: Boolean)
    begin
        IsEditable := NewEditable;
    end;
}