module ApplicationHelper
  def bootstrap_class_for(key)
    {
      success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[key.to_sym] || key
  end

  def form_error_viewer(form_object)
    if form_object.object.errors.present?
      '<div class="alert alert-danger"><span>Внимательно заполните данные</span></div><br />'.html_safe
    end
  end
end
