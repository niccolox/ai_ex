import Config

config :nx,
	default_backend: EXLA.Backend

config :openai,
  api_key: System.get_env("OPENAI_API_KEY"),
  organization_key: System.get_env("OPENAI_ORG_KEY"),
  api_url: "http://localhost/",
  http_options: [recv_timeout: :infinity, stream_to: self(), async: :once]


config :langchain, openai_key: System.get_env("OPENAI_API_KEY")
config :langchain, openai_org_id: System.get_env("OPENAI_ORG_KEY")  