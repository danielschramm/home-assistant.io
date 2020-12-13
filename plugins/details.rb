module Jekyll
  class DetailsBlock < Liquid::Block

    def render_details_block(vars:, converter:, classes: nil, parent_type: nil)
      result = Array.new
      result << vars.map do |entry|
        markup = Array.new
        markup << "<div class='details-block-item' onclick='showDetails(this)'>"
        markup << "<div class='details-block-title'>#{entry['title']}"
        markup << '<svg id="down" style="display: block;" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" /></svg>'
        markup << '<svg id="up" style="display: none;" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41,15.41L12,10.83L16.59,15.41L18,14L12,8L6,14L7.41,15.41Z" /></svg>'
        markup << "</div>"
        markup << "<div class='details-block-content' hidden onclick>#{converter.convert(entry['content'].to_s)}</div>"
        markup << "</div>"
      end
      result.join
    end

    def render(context)
      contents = super(context)
      vars = SafeYAML.load(contents)

      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

      <<~MARKUP
        <script>
        function showDetails(el) {
          const content = el.querySelector(".details-block-content");
          const up = el.querySelector(".details-block-title").querySelector("svg#up");
          const down = el.querySelector(".details-block-title").querySelector("svg#down");
          up.style.display = up.style.display === "none" ? "block" : "none";
          down.style.display = down.style.display === "none" ? "block" : "none";
          content.hidden = !content.hidden;
        }
        </script>
        <div class="details-block">
          #{render_details_block(vars: vars, converter: converter)}
        </div>
      MARKUP
    end
  end
end

Liquid::Template.register_tag('details', Jekyll::DetailsBlock)