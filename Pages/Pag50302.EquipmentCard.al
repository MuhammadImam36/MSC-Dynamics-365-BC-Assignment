page 50302 "Equipment Card"
{
    Caption = 'Equipment Card';
    PageType = Card;
    SourceTable = Equipment;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique code of the equipment. Assigned automatically from the number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the equipment.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category the equipment belongs to.';
                }
            }
            group(Control)
            {
                Caption = 'Status';
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the equipment is available, on loan, or under maintenance.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the equipment is blocked from being used.';
                }
            }
        }
    }
}