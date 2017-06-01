json.extract! site_setting, :id, :meta_title, :meta_desc, :meta_key, :comment_visible, :sliders_visible, :created_at, :updated_at
json.url site_setting_url(site_setting, format: :json)
