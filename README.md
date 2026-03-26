# Frogger 🐸

[![Processing](https://img.shields.io/badge/Processing-4.0+-0066CC?style=for-the-badge&logo=processing&logoColor=white)](https://processing.org/)

A simple remake of the classic 1981 arcade game "Frogger" built with Processing. Guide your frog across busy roads and treacherous rivers to reach the safety of the end zones!

## 🎮 Features

- **Classic Gameplay** - Navigate across incoming traffic vehicles and river obstacles
- **Moving Obstacles**:
  - Cars and racecars moving at different speeds
  - Floating logs that carry the frog
  - Turtles that also transport the frog
- **Scoring System** - Earn points for:
  - Moving forward (+10 per move)
  - Reaching end zones (+100 each)
- **Lives System** - 3 lives total
- **Time Limit** - 45 seconds

## 🎯 How to Play

### Goal
Get your frog to all 5 orange end zones at the top of the screen.

### Controls
| Key | Action |
|-----|--------|
| `W` / `w` | Move up |
| `A` / `a` | Move left |
| `S` / `s` | Move down |
| `D` / `d` | Move right |
| `p` | Start game |
| `h` | Return to home screen |

### Hazards
| Obstacle | Danger |
|----------|--------|
| Cars & Racecars | Touch = lose a life |
| River | Fall in = lose a life |
| Toxic Zone | Touch the area around end zones = lose a life |
| Time | Run out of time = game over |

### Safe Spots
- **Logs** - Float across the river (move with the log)
- **Turtles** - Float across the river (move with the turtles)
- **End Zones** - Orange squares at the top (safe zones)

## 📸 Screenshots

<table>
  <tr>
    <td align="center">
      <img width="250" alt="Home" src="https://github.com/user-attachments/assets/5941a645-ca49-461a-b28d-280717ab45d6"/>
      <br/><em>Home Screen</em>
    </td>
    <td align="center">
      <img width="250" alt="Game" src="https://github.com/user-attachments/assets/9cc74646-5c1d-4e92-b2d6-e3ffc3bdc0b0"/>
      <br/><em>Game Screen</em>
    </td>
    <td align="center">
      <img width="250" alt="Game Over" src="https://github.com/user-attachments/assets/c9d0b413-c8c3-44d6-a9d3-b4ed33e56dc6"/>
      <br/><em>Game-Over Screen</em>
    </td>
  </tr>
</table>

## 🛠️ Built With

- **Processing** - Java-based creative coding environment
- **Custom Sprites** - PNG images for frog, cars, logs, and turtles

## 📁 Project Structure
```
Frogger/
├── Frogger.pde 
├── FrogUp.png 
├── FrogDown.png 
├── FrogLeft.png 
├── FrogRight.png
├── FrogLives.png
├── Car.png 
├── Racecar.png 
├── Log.png 
├── Turtle.png 
└── README.md 
```
## 🚀 Installation

### Prerequisites
- [Processing](https://processing.org/download) 4.0 or higher

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/devjsonpan/Frogger.git
   cd Frogger
   ```

2. **Open in Processing**
- Launch the Processing IDE
- Open Frogger.pde
- Click the Run button (play icon)

## 📝 Acknowledgements
- This project was inspired by the classic 1981 arcade game ["Frogger"](https://en.wikipedia.org/wiki/Frogger)
