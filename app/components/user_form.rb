# Custom user form (predefined model and layout)
class UserForm < Netzke::Basepack::Form
  def configure(c)
    c.record = User.first # default user id - handy for individual component testing

    super

    c.model = "User"
    c.items = [
      {
        layout: :hbox,
        border: false,
        defaults: {border: false},
        items: [{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "-8"},
          items: [:name, :email]
        },{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "100%"},
          items: [:number_of_issues, :number_of_open_issues]
        }]
      }
    ]
  end
end
