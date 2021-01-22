defmodule ExMonWeb.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(ExMonWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(ExMonWeb.Gettext, "errors", msg, opts)
    end
  end
end
