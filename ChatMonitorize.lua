function ChatMonitorize_Handler(self,event,...)
	 _arg1 = string.lower(arg1)
		for i = 1, #ChatMonitorize_List do
			if ChatMonitorize_List[i] and string.find(_arg1,ChatMonitorize_List[i]) then
				UIErrorsFrame:Clear()
				UIErrorsFrame:AddMessage("Chat Monitorize Found: |cff00beff"..ChatMonitorize_List[i].."|r\rfrom \124cff00ff00"..arg2.."|r\r"..arg1.."")
				print("Chat Monitorize Found: |cff00beff"..ChatMonitorize_List[i].."|r from \124cff00ff00"..arg2.."|r\n"..arg1.."")
			end
		end
end

function MonitorizeWord_DelAll()
	ChatMonitorize_List = nil
	ChatMonitorize_List = {}
	print("Chat Monitorize |cffff0000DELETED ALL")
end

function ChatMonitorize_Help()
	print("Chat Monitorize Help: Write /cm <word> to monitorize the chat searching this word.");
end

function ChatMonitorize_GetList()
print("Chat Monitorize List:")
	if #ChatMonitorize_List > 0 then
		for i = 1, #ChatMonitorize_List do
			if ChatMonitorize_List[i] then
				print("  "..ChatMonitorize_List[i])
			end
		end
	else
		print("  |cffff0000EMPTY!");
		ChatMonitorize_Help()
	end
end

function MonitorizeWord(arg)
	if arg == "" then
		ChatMonitorize_Help()
		ChatMonitorize_GetList()
		return
	end

	local _arg = string.lower(arg)
	local found = false
	local index = 1
	for i = 1, #ChatMonitorize_List do
		if ChatMonitorize_List[i] and string.find(_arg,ChatMonitorize_List[i]) then
			found = true
			index = i
			break
		end
	end
	
	if found then
		ChatMonitorize_List[index] = nil
		print("ChatMonitorize: "..arg.." |cffff0000borrada.")
	else
		ChatMonitorize_List[#ChatMonitorize_List+1] = _arg
		print("ChatMonitorize: "..arg.." |cff00ff00agregada.")
	end
end

if not ChatMonitorize_List then
	ChatMonitorize_List = {}
end



ChatMonitorizeFrame = CreateFrame("Frame",nil,UIParent);
ChatMonitorizeFrame:SetScript("OnEvent",ChatMonitorize_Handler);
ChatMonitorizeFrame:RegisterEvent("CHAT_MSG_CHANNEL");


SlashCmdList["CHATMONITORIZE"] 		= MonitorizeWord;
SlashCmdList["CHATMONITORIZEDEL"] 	= MonitorizeWord_DelAll;
SLASH_CHATMONITORIZE1				= "/cm";
SLASH_CHATMONITORIZEDEL1 			= "/cmdel";