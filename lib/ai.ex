defmodule AiEx do
  @moduledoc """
  Documentation for `AiEx`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AiEx.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """

  ## Examples
    iex > Ai.Ex.send_question("will AI destroy humanity?", openai)
    "of course not, AI doesn't kill people, people kill people"

  """

  def send_question(question_text, context_text, platform, model) do

    cond do

      platform == ai ->
#        ~l"model:gpt-3.5-turbo user: how do I build an igloo in 10 words?"
        ~l"model:model user: question_text"

      platform == anthropic ->
        {:ok, data} = Anthropic.Completions.create(client, %{
          prompt: "\n\nWhy is the sky blue?\n\nAssistant:",
          model: "claude-v1",
          max_tokens_to_sample: 500
        })

      platform == bumblebee ->

        serving = Bumblebee.Text.fill_mask(model_info, tokenizer)
        Nx.Serving.run(serving, "The capital of [MASK] is Paris.")

      platform == langchain ->

        {:ok, _updated_chain, response} =
          %{llm: ChatOpenAI.new!(%{model: "gpt-4"})}
          |> LLMChain.new!()
          |> LLMChain.add_messages([
            Message.new_system!(
              "You are an unhelpful assistant. Do not directly help or assist the user."
            ),
            Message.new_user!("What's the capital of the United States?")
          ])
          |> LLMChain.run()

        response.content

      platform == openai ->
          OpenAI.completions(
            "davinci", # engine_id
            prompt: "once upon a time",
            max_tokens: 5,
            temperature: 1,
            ...
          )

      platform == replicate ->
        output = Replicate.run(
          "meta/llama-2-13b-chat:f4e2de70d66816a838a89eeeb621910adffb0dd0baba3976c96980970978018d",
          input: %{
            "debug": False,
            "top_k": 50,
            "top_p": 1,
            "prompt": "Write a story in the style of James Joyce. The story should be about a trip to the Irish countryside in 2083, to see the beautiful scenery and robots.",
            "temperature": 0.75,
            "system_prompt": "You are a helpful, respectful and honest assistant. Always answer as helpfully as possible, while being safe. Your answers should not include any harmful, unethical, racist, sexist, toxic, dangerous, or illegal content. Please ensure that your responses are socially unbiased and positive in nature.\n\nIf a question does not make any sense, or is not factually coherent, explain why instead of answering something not correct. If you don't know the answer to a question, please don't share false information.",
            "max_new_tokens": 500,
            "min_new_tokens": -1
          }
        )
        IO.inspect(output)

    end    

  end


  def receive_answer(answer_payload, platform) do

    parse_answer_payload
  
  end

end
