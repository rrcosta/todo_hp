module ApplicationHelper
  def plural_model_name(model)
    model.model_name.human(count: :many)
  end
end
