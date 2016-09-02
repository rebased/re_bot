class WodPost < FacebookPost
  CONNECTION_DATA = ["CrossFitELEKTROMOC", "posts"]

  def as_json
    JSON({text: post_text, attachments: [{text: extra_message}]})
  end

  private

  def post_text
    txt = post["message"]
    txt.gsub!(/#(\w+)/, "")
    txt.squeeze!("\n").strip!
    txt
  end

  def post_subject_indicators
    /^WOD#/
  end
end
