local Request = {}

function Request.Get<Table>(url: string, body: Table?, headers: { [string]: string }?, cookies: { [string]: string }?): Response
    return request({
        Url = url,
        Method = "GET",
        Body = body,
        Headers = headers,
        Cookies = cookies,
    })
end
function Request.Post<Table>(url: string, body: Table?, headers: { [string]: string }?, cookies: { [string]: string }?): Response
    return request({
        Url = url,
        Method = "GET",
        Body = body,
        Headers = headers,
        Cookies = cookies,
    })
end

function Request.Fetch(url: string): string
    return request({
        Url = url,
        Method = "GET",
    }).Body
end

export type Response = {
    Success: boolean,
    Body: string,
    StatusCode: number,
    StatusMessage: string,
    Headers: { [string]: string }
}

return Request