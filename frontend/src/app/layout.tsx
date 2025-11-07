import "./globals.css";
import { ReactNode } from "react";
import { CopilotKit } from "@copilotkit/react-core";

export const metadata = {
  title: "Agentic Chat - AI Search Assistant",
  description: "Powered by Pydantic AI with real-time web search via Tavily",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </head>
      <body>
        <CopilotKit runtimeUrl="/api/copilotkit" agent="pydantic_search_agent">
          {children}
        </CopilotKit>
      </body>
    </html>
  );
}