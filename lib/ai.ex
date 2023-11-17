defmodule AiEx do

#  alias AiEx, as: Ai
  import Anthropic
  import OpenAI
  @moduledoc """
  Documentation for `AiEx`.

  c("lib/folkbot_web/apps/ai_ex/lib/ai.ex")

  """

  # @doc """

  # ## Examples
  #   iex > AiEx.send_question("will AI destroy humanity?", "dont be evil", bumblebee, openai)
  #   "of course not, AI doesn't kill people, people kill people"

  # """

  def hello(openai) do
    :openai_world
  end

  def models(openai) do
    OpenAI.models()
  end

  # @doc """

  # ## Examples
  #   iex > AiEx.chat("openai", "model", "system", "user", "assistant", "user")
  #   "of course not, AI doesn't kill people, people kill people"


    #   OpenAI.chat_completion([
    #     model: "gpt-3.5-turbo",
    #     messages: [
    #       %{role: "system", content: "You are a helpful assistant."},
    #       %{role: "user", content: "Who won the world series in 2020?"},
    #       %{role: "assistant", content: "The Los Angeles Dodgers won the World Series in 2020."},
    #       %{role: "user", content: "Where was it played?"}
    #     ],
    #     stream: true, # set this param to true
    #   ]
    # )
    # |> Stream.each(fn res ->
    #   IO.inspect(res)
    # end)
    # |> Stream.run()

  # """

  def chat(openai, model, system, user, assistant, user) do
    OpenAI.chat_completion([
        model: "gpt-3.5-turbo",
        messages: [
          %{role: "system", content: "You are a helpful assistant."},
          %{role: "user", content: "Who won the world series in 2020?"},
          %{role: "assistant", content: "The Los Angeles Dodgers won the World Series in 2020."},
          %{role: "user", content: "Where was it played?"}
        ],
        stream: true,
      ]
    )
    |> Stream.each(fn res ->
      IO.inspect(res)
    end)
    |> Stream.run()
  end

  def chat(anthropic, model, prompt, client) do
    {:ok, data} = Anthropic.Completions.create(client, %{
      prompt: "\n\nWhy is the sky blue?\n\nAssistant:",
      model: "claude-v1",
      max_tokens_to_sample: 500
    })
  end

  # def chat(bumblebee, prompt, model_info, tokenizer) do
  #   # serving = Bumblebee.Text.fill_mask(model_info, tokenizer)
  #   # Nx.Serving.run(serving, "The capital of [MASK] is Paris.")
  # end

  def chat(langchain) do
  end

  def chat(replicate) do
  end

  def chat(ai) do
  end

end
