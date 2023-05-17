module ApplicationHelper

  def remote_form(resource, options = {}, &block)
    default_options = { remote: true }
                      .deep_merge(stimulus_options)
                      .deep_merge(html_options)

    form_for(
      resource,
      default_options.deep_merge(options),
      &block
    )
  end

  def controlled_form(&block)
    tag.div(data: { controller: 'form' }) do
      tag.div(data: { target: 'form.content' }, &block)
    end
  end

  def stimulus_options(options = {})
    { data: { action: 'ajax:error->form#onPostError' }.merge(options) }
  end

end
