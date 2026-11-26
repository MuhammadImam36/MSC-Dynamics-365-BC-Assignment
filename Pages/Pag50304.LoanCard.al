page 50304 "Loan Card"
{
    Caption = 'Loan Card';
    PageType = Document;
    SourceTable = "Loan Header";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = Rec.Status = Rec.Status::Open;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan document number. Assigned automatically from the number series.';
                }
                field(Employee; Rec.Employee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the employee borrowing the equipment.';
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
            part(Lines; "Loan Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Caption = 'Release';
                ToolTip = 'Release the loan document so it can no longer be edited.';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Enabled = Rec.Status = Rec.Status::Open;

                trigger OnAction()
                begin
                    Rec.Release();
                    CurrPage.Update(false);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = All;
                Caption = 'Reopen';
                ToolTip = 'Reopen the released loan document so it can be edited again.';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Enabled = Rec.Status = Rec.Status::Released;

                trigger OnAction()
                begin
                    Rec.Reopen();
                    CurrPage.Update(false);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Lines.Page.SetEditableState(Rec.Status = Rec.Status::Open);
    end;
}