// Learn more about clients at https://docs.boundaryml.com/docs/snippets/clients/overview

client<llm> CustomGPT4o {
  provider openai
  options {
    model "gpt-4o-2024-11-20"
    api_key env.OPENAI_API_KEY
    temperature 0.7
    top_p 0.9
    max_tokens 16384
  }
}

client<llm> LowTempGPT4o {
  provider openai
  options {
    model "gpt-4o-2024-11-20"
    api_key env.OPENAI_API_KEY
    temperature 0.4
    max_tokens 16384
  }
}

client<llm> CustomGPT4oMini {
  provider openai
  retry_policy Exponential
  options {
    model "gpt-4o-mini"
    api_key env.OPENAI_API_KEY
    temperature 0.8
    max_tokens 16384
  }
}

client<llm> Customo3Mini {
  provider openai
  retry_policy Exponential
  options {
    model "o3-mini"
    api_key env.OPENAI_API_KEY
    reasoning_effort "low"
    max_completion_tokens 100000
  }
}

client<llm> CustomSonnet {
  provider anthropic
  options {
    model "claude-3-5-sonnet-20241022"
    api_key env.ANTHROPIC_API_KEY
  }
}


client<llm> CustomHaiku {
  provider anthropic
  retry_policy Constant
  options {
    model "claude-3-haiku-20240307"
    api_key env.ANTHROPIC_API_KEY
  }
}
client<llm> CustomGemini {
  provider google-ai
  retry_policy Exponential
  options {
    model "gemini-2.0-flash-thinking-exp-01-21"
    api_key env.GOOGLE_API_KEY
    generationConfig {
      maxOutputTokens 635536
      temperature 0.8
      topP 0.9
    }
  }
}

client<llm> CustomGeminiFlash {
  provider google-ai
  retry_policy Exponential
  options {
    model "gemini-2.0-flash-001"
    api_key env.GOOGLE_API_KEY
    generationConfig {
      maxOutputTokens 635536
      temperature 0.8
      topP 0.9
    }
  }
}

client<llm> OpenRouter {
  provider "openai-generic"
  options {
    base_url "https://openrouter.ai/api/v1"
    api_key env.OPENROUTER_API_KEY
    model "openai/o3-mini"
  }
}


client<llm> GemkuA {
  provider round-robin
  options {
    // This will alternate between the two clients
    strategy [CustomGemini, CustomGPT4oMini]
  }
}

client<llm> GemkuB {
  provider round-robin
  options {
    // This will alternate between the two clients
    strategy [CustomGPT4oMini, CustomGemini]
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/round-robin
client<llm> CustomFast {
  provider round-robin
  options {
    // This will alternate between the two clients
    strategy [CustomGemini, CustomGPT4oMini]
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/fallback
client<llm> OpenaiFallback {
  provider fallback
  options {
    // This will try the clients in order until one succeeds
    strategy [LowTempGPT4o, CustomGPT4oMini]
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/retry
retry_policy Constant {
  max_retries 3
  // Strategy is optional
  strategy {
    type constant_delay
    delay_ms 200
  }
}

retry_policy Exponential {
  max_retries 3
  // Strategy is optional
  strategy {
    type exponential_backoff
    delay_ms 300
    mutliplier 1.5
    max_delay_ms 10000
  }
}