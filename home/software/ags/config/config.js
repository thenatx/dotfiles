const hyprland = await Service.import("hyprland")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")

const date = Variable("", {
	poll: [1000, 'date "+%H:%M:%S %b %e."'],
})


function ClientTitle() {
	const getTitle = () => {
		const LIMIT_TITLE_LENGTH = 15
		const title = hyprland.active.client.class;

		if (title.length > LIMIT_TITLE_LENGTH) {
			return `${title.slice(0, LIMIT_TITLE_LENGTH)}...`
		}

		return title
	}

	const title = Utils.watch(getTitle(), hyprland.active.client, getTitle)

	return Widget.Label({
		class_name: "win-title",
		css: title.as(v => v.length >= 1 ? " " : "background: transparent"),
		label: title,
	})
}

function Clock() {
	return Widget.Label({
		class_name: "bar-clock",
		label: date.bind(),
	})
}

function Media() {
	const label = Utils.watch("", mpris, "player-changed", () => {
		if (mpris.players[0].play_back_status == "Playing") {
			const { track_artists, track_title } = mpris.players[0]

			return `${track_title} - ${track_artists[0]} `
		} else {
			return "Nothing is playing"
		}
	})

	return Widget.Button({
		class_name: "bar-media",
		css: label.as(v => v.length >= 0 ? "" : "background: transparent"),
		on_primary_click: () => mpris.getPlayer("")?.playPause(),
		on_scroll_up: () => mpris.getPlayer("")?.next(),
		on_scroll_down: () => mpris.getPlayer("")?.previous(),
		child: Widget.Label({ label }),
	})
}

function Volume() {
	const icons = {
		101: "overamplified",
		67: "high",
		34: "medium",
		1: "low",
		0: "muted",
	}

	function getIcon() {
		const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
			threshold => threshold <= audio.speaker.volume * 100)
		return `audio-volume-${icons[icon]}-symbolic`
	}

	const icon = Widget.Icon({
		class_name: "volume-icon",
		icon: Utils.watch(getIcon(), audio.speaker, getIcon),
	})

	const volumeLevel = Widget.Label({
		label: audio.speaker.bind("volume").as(v => `${Math.round(v * 100)}% `),
	})

	const container = Widget.Box({
		children: [icon, volumeLevel],
	})

	return Widget.Button({
		child: container,
		class_name: "bar-volume",

		on_primary_click: () =>
			audio.speaker.is_muted = !audio.speaker.is_muted,
		on_scroll_up: () =>
			audio.speaker.volume = audio.speaker.volume <= 100 ? audio.speaker.volume + 0.05 : audio.speaker.volume,
		on_scroll_down: () =>
			audio.speaker.volume = audio.speaker.volume - 0.05,
	})
}

const LauncherButton = () => Widget.Button({
	label: ' ',
	cursor: 'pointer',
	class_name: 'launcher-button',
	onClicked: () => Utils.execAsync("anyrun")
})

function Left() {
	return Widget.Box({
		class_name: "bar-left",
		css: 'min-height: 30px',
		spacing: 8,
		children: [
			LauncherButton(),
			ClientTitle(),
		],
	})
}

function Center() {
	return Widget.Box({
		class_name: "bar-center",
		css: 'min-height: 30px',
		spacing: 8,
		children: [
			Media(),
		],
	})
}

function Right() {
	return Widget.Box({
		class_name: "bar-right",
		css: 'min-height: 30px',
		hpack: "end",
		spacing: 8,
		children: [
			Volume(),
			Clock(),
		],
	})
}

function Bar(monitor = 0) {
	return Widget.Window({
		monitor,
		class_name: "bar",
		hexpand: true,
		name: `bar - ${monitor} `,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Left(),
			center_widget: Center(),
			end_widget: Right(),
		}),
	})
}

App.config({
	style: "./styles.css",
	windows: [
		Bar(),
	],
})

export { }
